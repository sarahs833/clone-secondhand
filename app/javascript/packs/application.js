require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";


var new_message = document.querySelector('.display');
var chat = document.querySelector('.chat')

chat.addEventListener('onclick', function(){
  new_message.classList.add('.display_none');
})
