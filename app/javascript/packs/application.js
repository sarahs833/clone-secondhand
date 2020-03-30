require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";


var chats = document.querySelectorAll('.chats')
var messages = document.querySelectorAll('.display')

chats.forEach(function (chat) {
  chat.addEventListener('click', function(e){
    var number = e.currentTarget.dataset.ind;
    messages.forEach(function(message) {
      if (message.dataset.number === number) {
        message.classList.remove('show');
        message.classList.add('display_none')
      }
    })
  })
})
