import 'package:flutter/material.dart';

String generateEmailHtml({required String name}){
  return '''
      <!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
    <head>
        <style>
            body {
              font-family: Inter, sans-serif;
              margin: 0;
              padding: 0;
              background-color: #f6f6f6;
            }
            .container {
              width: 85%;

              margin: 0 auto;
              background-color: #ffffff;
              padding: 20px;
              border-radius: 8px;
              box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .header {
              background-color: #4CAF50;
              color: #ffffff;
              padding: 10px 20px;
              text-align: center;
              border-top-left-radius: 8px;
              border-top-right-radius: 8px;
            }
            .footer {
              background-color: #00C0B0;
              color: #ffffff;
              padding: 30px;
              text-align: center;
              border-bottom-left-radius: 5px;
              border-bottom-right-radius: 5px;
            }
            .content {
              padding: 50px;
            }
            .custom-text {
              font-size: 17px;
              font-weight: 300;
            }
            .custom-text02 {
              font-size: 17px;
              font-weight: 300;
              color: #EDEDED;
              text-align: start;
              line-height: 25px;
            }
            .custom-textS1 {
              margin-bottom: 30px;
            }
            .custom-text2 {
              font-size: 40px;
              font-weight: 700;
              margin-top: 30px;
              margin-bottom: 30px;
            }
            .custom-link {
              color: #000000; /* Optional: Customize link color */
              font-weight: 500;
<!--              text-decoration: none; /* Optional: Customize link decoration */-->
            }
            .custom-link02 {
              color: #ffffff; /* Optional: Customize link color */
            }
            .icon {
                width: 25px;
                height: 25px;
                color: #ffffff;
            }
            .imageIcon {
                width: 25px;
                height: 25px;
            }
        </style>
        <title>
            Welcome to Our Service
        </title>
    </head>
    <body>
        <div class="container">
            <div class="content">
                <img style="margin-bottom: 60px" src="https://firebasestorage.googleapis.com/v0/b/ugradio-a3901.appspot.com/o/PeonyApp%2FGroup.png?alt=media&token=b52e05c9-1512-4096-948b-e85a4b14b9a1" alt="Welcome Image">
                <p class="custom-text custom-textS1">Hello $name,</p>
                <p class="custom-text custom-textS1">Here is your One Time Password (OTP).</p>
                <p class="custom-text2">123456</p>
                <p class="custom-text">This OTP expires in 20minutes</p>
                <p class="custom-text">You can request for another OTP - <a href="" class="custom-link">Here</a></p>
            </div>
            <div class="footer">
                    <p class="custom-text02">This email was sent to <a href="" class="custom-link02">macthedesigner@gmail.com</a>. If you'd rather not receive this kind of email, you can <a href="" class="custom-link02">unsubscribe</a> or <a href="" class="custom-link02">manage your email preferences</a>.</p>
                    <span style="height: 20px;"></span> <!-- Spacer -->
                    <p class="custom-text02">Peony kids, 12, The Rock Mews, Rock Drive (by IMAX Cinemas), Lekki Phase 1, Lagos Nigeria.</p>
                    <span style="height: 400px;"></span> <!-- Spacer -->
                <div style="display: flex; justify-content: space-between; align-items: center;">
                    <div style="flex: 1; text-align: left;">
        <span style="display: inline-block;">
            <img class="imageIcon" src="https://firebasestorage.googleapis.com/v0/b/ugradio-a3901.appspot.com/o/PeonyApp%2Fimage%2015.png?alt=media&token=faab5531-20e5-41f3-9715-723de2bf3475" alt="Welcome Image">
        </span>
                    </div>
                    <div style="flex: 1; text-align: right;">
        <span style="display: inline-block;">
            <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="32" height="32">
                <path fill="#f7f7f7" d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64h98.2V334.2H109.4V256h52.8V222.3c0-87.1 39.4-127.5 125-127.5c16.2 0 44.2 3.2 55.7 6.4V172c-6-.6-16.5-1-29.6-1c-42 0-58.2 15.9-58.2 57.2V256h83.6l-14.4 78.2H255V480H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64z"/>
            </svg>
        </span>
                        <span style="display: inline-block; margin-left: 10px;">
            <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="32" height="32">
                <path fill="#ffffff" d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"/>
            </svg>
        </span>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
  ''';
}