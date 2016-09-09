$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $('#show').hide();
  $('#hint').click(function(event){
    event.preventDefault();
    $('#show').show();
  });


  // $('.box').click(function(event)){
  //   event.preventDefault();


  // }


  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
