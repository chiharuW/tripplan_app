// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'

require('jquery')
import "cocoon"; 
 // 候補地と計画を複数保存するために追加した

window.$ = window.jQuery = require('jquery');
require('packs/raty')
 // 候補地の取捨選択のための☆評価として追加した

Rails.start()
Turbolinks.start()
ActiveStorage.start()

