import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

import './assets/main.css'

import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome"
import { library } from "@fortawesome/fontawesome-svg-core"
import { faChevronDown, faVolumeUp } from "@fortawesome/free-solid-svg-icons"
import { faEye } from "@fortawesome/free-solid-svg-icons"
import { faGear } from "@fortawesome/free-solid-svg-icons"
import { faCircleQuestion } from "@fortawesome/free-solid-svg-icons"
import { faBookSkull } from "@fortawesome/free-solid-svg-icons"
import { faTriangleExclamation } from "@fortawesome/free-solid-svg-icons"
import { faXmark } from "@fortawesome/free-solid-svg-icons"
import { faChevronRight } from "@fortawesome/free-solid-svg-icons"
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons"
import { faCircle } from "@fortawesome/free-solid-svg-icons"
import { faUser } from "@fortawesome/free-solid-svg-icons"
import { faArrowRightFromBracket } from "@fortawesome/free-solid-svg-icons"

library.add(faVolumeUp)
library.add(faEye)
library.add(faGear)
library.add(faCircleQuestion)
library.add(faBookSkull)
library.add(faTriangleExclamation)
library.add(faXmark)
library.add(faChevronRight)
library.add(faChevronLeft)
library.add(faCircle)
library.add(faUser)
library.add(faChevronDown)
library.add(faArrowRightFromBracket)
createApp(App).use(router).component("font-awesome-icon", FontAwesomeIcon).mount('#app')
