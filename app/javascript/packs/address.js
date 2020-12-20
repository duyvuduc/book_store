$(function() {
  $('#add-address').click(function() {
    var length = $('.city_field').length
    var html =  '<div class="field">' +
                  '<label class = "city_field" >City</label>' +
                  '<input type="text" name="user[addresses_attributes]['+ length +'][city]" id="user_addresses_attributes_' + length + '_city">' +
                '</div>'+
                '<div class="field">' +
                  '<label>Street</label>' +
                  '<input type="text" name="user[addresses_attributes]['+ length +'][street]" id="user_addresses_attributes_'+ length +'_street">' +
                '</div>'
    $('.container').append(html)
  })
})
