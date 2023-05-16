import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

import './assets/main.css'

import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome"
import { library } from "@fortawesome/fontawesome-svg-core"
import { faVolumeUp } from "@fortawesome/free-solid-svg-icons"
import { faEye } from "@fortawesome/free-solid-svg-icons"

library.add(faVolumeUp)
library.add(faEye)
createApp(App).use(router).component("font-awesome-icon", FontAwesomeIcon).mount('#app')
