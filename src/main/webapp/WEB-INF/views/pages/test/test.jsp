body {
    margin: 0;
    padding: 0;
}
* {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
}

.page {
    width: 21cm;
    min-height: 29.7cm;
    padding: 2cm;
    margin: 0 auto;
    background:#eee;
}

.subpage {
    border: 2px red solid;
    background:#fff;
    height: 257mm;
}

@page {
    size: A4;
    margin: 0;
}

@media print {
    html, body {
        width: 210mm;
        height: 297mm;
    }

    .page {
        margin: 0;
        border: initial;
        width: initial;
        min-height: initial;
        box-shadow: initial;
        background: initial;
        page-break-after: always;
    }
}