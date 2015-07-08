# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.email-form').hide() # Hide both email forms if JavaScript enabled
  intro = $('div#intro') # Store the intro div as a variable
  fanForm = $('form.fanForm') # Store User Type 1 form as a variable
  artistForm = $('form.artistForm') # Store User Type 2 form as a variable

  # Create the "I'm User Type 1!" button
  fanBtn = $('<button></button>',
    text: 'I\'m User Type 1!'
    class: 'btn fanBtn')

  # Create the "I'm User Type 2!" button
  artistBtn = $('<button></button>',
    text: 'I\'m User Type 2!'
    class: 'btn artistBtn')

  intro.append fanBtn, artistBtn

  # Functionality for User Type 1's button - reveal email form
  fanBtn.on 'click', ->
    fanForm.slideToggle 250
    artistForm.slideUp()

  # Functionality for User Type 1's button - reveal email form
  artistBtn.on 'click', ->
    artistForm.slideToggle 250
    fanForm.slideUp()


