# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

  $('#text_or_file_csv_text').click ->
    $('#collection_csv_text_input').attr('disabled', null)
    $('#collection_csv_file_input').attr('disabled', 'disabled')

  $('#text_or_file_csv_file').click ->
    $('#collection_csv_text_input').attr('disabled', 'disabled')
    $('#collection_csv_file_input').attr('disabled', null)
