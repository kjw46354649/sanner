<%@ page pageEncoding='UTF-8' contentType='text/html; charset=UTF-8' %>
<!DOCTYPE html>
<html>
  <head>
    <title>JSPrintManager - Print RAW Commands & Known File Formats from Javascript</title>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <meta charset="utf-8" />
    <style>
      table,
      textarea {
        width: 100%;
        height: 200px;
        padding: 3px;
      }

      a {
        cursor: pointer;
      }

      .githubIcon {
        margin-right: 10px;
        color: #fff;
        font-size: 32px;
      }

      .jspmStatus {
        color: #fff;
        margin-left: 10px;
      }

      .round {
        display: inline-block;
        height: 40px;
        width: 40px;
        line-height: 40px;
        -moz-border-radius: 20px;
        border-radius: 20px;
        background-color: #cd2122;
        color: #fff;
        text-align: center;
      }

      .content {
        padding-top: 80px;
        padding-bottom: 20px;
      }

      .fileFormats {
        background-color: #ececec;
        font-weight: bold;
        color: #666;
      }

      .topMost {
        z-index: 1080;
      }

      .white {
        color: #fff;
      }
    </style>
  </head>

  <body>
    <div id="root"></div>

    <file-formats-modal id="files-requeriments"></file-formats-modal>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bluebird/3.3.5/bluebird.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <!--JSPrintManager scripts-->
    <script type="text/javascript" src="/resource/plugins/jspPrint/JSPrintManager.js"></script>
    <script type="text/javascript" src="/resource/plugins/jspPrint/zip.js"></script>
    <script type="text/javascript" src="/resource/plugins/jspPrint/zip-ext.js"></script>
    <script type="text/javascript" src="/resource/plugins/jspPrint/deflate.js"></script>
    <!--end JSPrintManager scripts-->

      <script src="https://unpkg.com/react@16/umd/react.development.js"></script>
      <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
      <script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script>

    <div style="text-align:center">
      <h1>Print Zebra ZPL commands from Javascript</h1>
      <hr />
      <label class="checkbox">
        <input type="checkbox" id="useDefaultPrinter" /> <strong>Print to Default printer</strong>
      </label>
      <p>or...</p>
      <div id="installedPrinters">
        <label for="installedPrinterName">Select an installed Printer:</label>
        <select name="installedPrinterName" id="installedPrinterName"></select>
      </div>
      <br /><br />
      <button type="button" onclick="print();">Print Now...</button>
    </div>

    <script>

      //WebSocket settings
      JSPM.JSPrintManager.auto_reconnect = true;
      JSPM.JSPrintManager.start();
      JSPM.JSPrintManager.WS.onStatusChanged = function () {
        if (jspmWSStatus()) {
          //get client installed printers
          JSPM.JSPrintManager.getPrinters().then(function (myPrinters) {
            var options = '';
            for (var i = 0; i < myPrinters.length; i++) {
              options += '<option>' + myPrinters[i] + '</option>';
            }
            $('#installedPrinterName').html(options);
          });
        }
      };

      //Check JSPM WebSocket status
      function jspmWSStatus() {
        if (JSPM.JSPrintManager.websocket_status == JSPM.WSStatus.Open)
          return true;
        else if (JSPM.JSPrintManager.websocket_status == JSPM.WSStatus.Closed) {
          alert('JSPrintManager (JSPM) is not installed or not running! Download JSPM Client App from https://neodynamic.com/downloads/jspm');
          return false;
        }
        else if (JSPM.JSPrintManager.websocket_status == JSPM.WSStatus.BlackListed) {
          alert('JSPM has blacklisted this website!');
          return false;
        }
      }

      //Do printing...
      function print(o) {
        if (jspmWSStatus()) {
          //Create a ClientPrintJob
          var cpj = new JSPM.ClientPrintJob();
          //Set Printer type (Refer to the help, there many of them!)
          if ($('#useDefaultPrinter').prop('checked')) {
            cpj.clientPrinter = new JSPM.DefaultPrinter();
          } else {
            cpj.clientPrinter = new JSPM.InstalledPrinter($('#installedPrinterName').val());
          }
          //Set content to print...
          //Create Zebra ZPL commands for sample label
          var cmds =  "^XA";
          cmds += "^FO20,30^GB750,1100,4^FS";
          cmds += "^FO20,30^GB750,200,4^FS";
          cmds += "^FO20,30^GB750,400,4^FS";
          cmds += "^FO20,30^GB750,700,4^FS";
          cmds += "^FO20,226^GB325,204,4^FS";
          cmds += "^FO30,40^ADN,36,20^FDShip to:^FS";
          cmds += "^FO30,260^ADN,18,10^FDPart number #^FS";
          cmds += "^FO360,260^ADN,18,10^FDDescription:^FS";
          cmds += "^FO30,750^ADN,36,20^FDFrom:^FS";
          cmds += "^FO150,125^ADN,36,20^FDAcme Printing^FS";
          cmds += "^FO60,330^ADN,36,20^FD14042^FS";
          cmds += "^FO400,330^ADN,36,20^FDScrew^FS";
          cmds += "^FO70,480^BY4^B3N,,200^FD12345678^FS";
          cmds += "^FO150,800^ADN,36,20^FDMacks Fabricating^FS";
          cmds += "^XZ";
          cpj.printerCommands = cmds;
          //Send print job to printer!
          cpj.sendToClient();
        }
      }

    </script>
  </body>
</html>
