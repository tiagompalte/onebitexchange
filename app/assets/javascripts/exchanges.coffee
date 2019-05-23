$(document).ready ->

  $('#amount').on('input', convert)
  $("#source_currency").on('change', convert)
  $("#target_currency").on('change', convert)

  $('#change_coins').on('click', () ->
    source = $("#source_currency").val()
    target = $("#target_currency").val()
    $("#source_currency").val(target)
    $("#target_currency").val(source)
    convert()
  )

convert = () ->

  $('#result').val('')

  if !$("#amount").val() || !$("#amount").val().length
    return;

  $.ajax '/convert',
    type: 'GET'
    dataType: 'json'
    data: {
      source_currency: $("#source_currency").val(),
      target_currency: $("#target_currency").val(),
      amount: $("#amount").val()
    }
    error: (jqXHR, textStatus, errorThrown) ->
      alert textStatus
    success: (data, text, jqXHR) ->
      $('#result').val(data.value)