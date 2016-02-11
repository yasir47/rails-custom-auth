(function() {
    $(function () {
        var chat;
        chat = $('#messages').data('room');

        App["new"] = App.cable.subscriptions.create({
                channel: "NewChannel",
                chat: chat
            },
            {
                connected: function () {
                },
                disconnected: function () {
                    alert("connected to cable");
                },
                received: function (data) { //show data on view
                    $('#new1').append(data['message']);
                },
                speak: function (message, userId,roomId) { // send data to new_chanel.rb to speak method
                    this.perform('speak', {
                        message: message,
                        id: userId,
                        room_id: roomId,
                    });
                },
            });
    });
}).call(this);

$(document).ready(function(){
    $("#btn1").click(function(){
        App.new.speak($('#message1').val(),$('#userId1').val(),$('#chatRoom').val());
    });
});