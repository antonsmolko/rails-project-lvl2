// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "bootstrap/dist/js/bootstrap.bundle.min"
import "../../assets/stylesheets/application.css"

import { library, dom } from '@fortawesome/fontawesome-svg-core'
import { faUserAstronaut, faThumbsUp } from '@fortawesome/free-solid-svg-icons'
import { faThumbsUp as farThumbsUp } from '@fortawesome/free-regular-svg-icons'

library.add(faUserAstronaut)
library.add(faThumbsUp)
library.add(farThumbsUp)

dom.watch()