$(document).ready(function(event){

  $('#search-bar').on("submit", function(event){
    event.preventDefault();
    // console.log($('#name').val())
    $("#org-hidden").val($('#name').val())
    $("#owner-form").show();
    $(this).remove();
    $('#search_results').remove();

  });

  $('.add-hospital-form').on("submit", function(event){
    event.preventDefault();
    var searchForm = $(this);

  });

  $('#name').on("keyup", function(event) {
    var searchField = $(this);
    // console.log(searchField)
    var searchData = searchField.val();
    console.log(searchData);
    if (searchData.length > 4) {
       var searchRequest = $.ajax({
        url: '/organizations/search',
        method: 'GET',
        data: searchField.serialize()
      });

       searchRequest.done(function(response) {
         console.log(response);
        $("#search_results").html(response);
        $("#org-reg-header").html("Please Provide us with Some Details");
      });
     }
  });

  $('#search_results').on('click', 'h5', function(event){
    event.preventDefault();
    var hospitalName = $(this).text();
    $('#name').val(hospitalName);
    $('#submit_button').val('Select');

  });

  $("#add-org-button").on("click", function() {
    $("#search-field").focus();
  });
});

$(document).ready(function(event){

  $('#approve_pet_owner').on("click", function(event){
    event.preventDefault();

  });

});
