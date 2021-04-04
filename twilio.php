<?php
// Require the bundled autoload file - the path may need to change
// based on where you downloaded and unzipped the SDK
require 'assets/twilio-php-main/src/Twilio/autoload.php';

// Use the REST API Client to make requests to the Twilio REST API
use Twilio\Rest\Client;

function send_text($phone, $body)
{
    // Your Account SID and Auth Token from twilio.com/console
    $sid = 'AC83bfab7390cb650657e364fe18fdb211';
    $token = '0236c196d38ed62917895a47f3b621f0';
    $client = new Client($sid, $token);
    $phone = '+234' . $phone;

    // Use the client to do fun stuff like send text messages!
    $client->messages->create(
        // the number you'd like to send the message to
        $phone,
        [
            // A Twilio phone number you purchased at twilio.com/console
            'from' => '+12056065832',
            // the body of the text message you'd like to send
            'body' => $body
        ]
    );
}