# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "popper", to: "popper.js", preload: true
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
