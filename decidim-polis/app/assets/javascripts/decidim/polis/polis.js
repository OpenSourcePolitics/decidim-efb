// = require jquery.browser
// = require jquery-iframe-auto-height
// = require_self


function getConversationId(){
  return "3ywrd98jrx";
}

function completeUrl(){
  var conversationId = getConversationId()

  if(conversationId){
    $(".append-admin-link").append("<li><a class= 'btn admin-btn' href= 'https://pol.is/m/"+ conversationId + "/comments'> Modérations commentaires </a> </li>")
    $(".append-admin-link").append("<li><a class= 'btn admin-btn' href= 'https://pol.is/m/"+ conversationId + "/stats'> Statistiques </a> </li>")
    $(".append-admin-link").append("<li><a class= 'btn admin-btn' href= 'https://pol.is/m/"+ conversationId + "/export'> Export </a> </li>")
    $(".append-admin-link").append("<li><a class= 'btn admin-btn' href= 'https://pol.is/m/"+ conversationId + "/reports'> Synthèse </a> </li>")
    $(".append-admin-link").append("<li><a class= 'btn admin-btn' href= 'https://pol.is/m/"+ conversationId + "/participants'> Modération participants </a> </li>")
  }
}

$(document).ready(function() {
  completeUrl()
});