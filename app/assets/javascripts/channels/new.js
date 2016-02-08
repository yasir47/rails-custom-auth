
(function () {
    App["new"] = App.cable.subscriptions.create("NewChannel", {


        connected: function () {
        },
        disconnected: function () {
        },
        received: function (data) { //show data on view
            $('#new1').append(data['message']);
        },

        speak: function (message,userId) { // send data to new_chanel.rb to speak method
            this.perform('speak', {
                message: message,
                id: userId
            });
        },
    });

}).call(this);

$(document).ready(function(){
    $("#btn1").click(function(){
        App.new.speak($('#message1').val(),$('#userId1').val())
    });
});