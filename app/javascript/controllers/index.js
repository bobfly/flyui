// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import CollapsibleController from "./collapsible_controller"
application.register("collapsible", CollapsibleController)

import DateRangeController from "./date_range_controller"
application.register("date-range", DateRangeController)

import EditController from "./edit_controller"
application.register("edit", EditController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import Flatpickr from 'stimulus-flatpickr'
application.register("flatpickr", Flatpickr)

import ToastController from "./toast_controller"
application.register("toast", ToastController)

