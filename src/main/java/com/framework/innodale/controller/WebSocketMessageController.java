package com.framework.innodale.controller;

import com.framework.innodale.entity.NotificationMessage;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class WebSocketMessageController {

    @SendTo("/topic/pop")
    public NotificationMessage popMessageSend(@Payload NotificationMessage notificationMessage) {
        return notificationMessage;
    }

    @SendTo("/topic/drawing")
    public NotificationMessage drawingMessageSend(@Payload NotificationMessage notificationMessage) {
        return notificationMessage;
    }

    @SendTo("/topic/worker")
    public NotificationMessage workerMessageSend(@Payload NotificationMessage notificationMessage) {
        return notificationMessage;
    }

    @SendTo("/topic/alarm")
    public NotificationMessage alarmMessageSend(@Payload NotificationMessage notificationMessage) {
        return notificationMessage;
    }
}
