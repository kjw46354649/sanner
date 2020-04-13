package com.framework.innodale.component;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component(value = "commandExecuteUtil")
public class CommandExecuteUtil {

    private static final Logger logger = LoggerFactory.getLogger(CommandExecuteUtil.class);

    private static String OS = System.getProperty("os.name").toLowerCase();

    /**
     * Os Check and Execute Commander
     * @param cmd
     * @return
     * @throws IOException
     * @throws InterruptedException
     */
    public static int execCommand(String... cmdList) throws IOException, InterruptedException {

        if (OS.contains("win")) {
            String[] use = { "cmd", "/c" };
            return runCommand(new String[]{"cmd", "/c"}, cmdList);
        } else if (OS.contains("nix") || OS.contains("nux") || OS.contains("aix")) {
            String[] use = { "/bin/sh", "-c" };
            return runCommand(new String[]{"/bin/sh", "-c"}, cmdList);
        } else {
            return -1;
        }
    }

    /**
     * Run Commander
     * @param use
     * @param cmd
     * @return
     * @throws IOException
     * @throws InterruptedException
     */
    public static int runCommand(String[] use, String... cmdLists) throws IOException, InterruptedException {

        StringBuffer sbOut = new StringBuffer();
        String line;

        List<String> cmdList = new ArrayList<String>(Arrays.asList(use));
        cmdList.addAll(Arrays.asList(cmdLists));

        ProcessBuilder builder = new ProcessBuilder(cmdList.toArray(new String[0]));
        builder.redirectErrorStream(true);

        Process p = builder.start();

        BufferedReader bri = new BufferedReader(new InputStreamReader(p.getInputStream(), "UTF-8"));
        while ((line = bri.readLine()) != null) {
            sbOut.append(line + "\n");
        }
        bri.close();

        System.out.println("sbOut=[" + sbOut.toString() + "]");

        Integer exitValue = p.waitFor();

        return exitValue;
    }
}
