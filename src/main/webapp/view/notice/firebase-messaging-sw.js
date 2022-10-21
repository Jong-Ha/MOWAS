importScripts('https://www.gstatic.com/firebasejs/4.8.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/4.8.1/firebase-messaging.js');

// Initialize Firebase
var config = {
    apiKey: "enter api key",
    authDomain: "test-4e9a6.firebaseapp.com",
    databaseURL: "https://test-4e9a6.firebaseio.com",
    projectId: "test-4e9a6",
    storageBucket: "test-4e9a6.appspot.com",
    messagingSenderId: "90275796882"
};
firebase.initializeApp(config);

const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function(payload){

    const title = "Hello World";
    const options = {
        body: payload.data.status
    };

    return self.registration.showNotification(title,options);
});


messaging.onMessage(function(payload){
    console.log('onMessage: ', payload);
    var title = "고라니 서비스";
    var options = {
        body: payload.notification.body,
        icon :payload.notification.icon
    };

    var notification = new Notification(title, options);
});
