// CASEIN CUSTOM
// Use this file for your project-specific Casein JavaScript
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary

$(document).ready(function() {
  $.cloudinary.config({ cloud_name: 'diogofgr'})
  $('.attachinary-input').attachinary();
});
