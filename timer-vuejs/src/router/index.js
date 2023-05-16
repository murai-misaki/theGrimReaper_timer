import { createRouter, createWebHistory } from 'vue-router'

import NotificationPage from '../views/NotificationPage'
import TimerPage from '../views/TimerPage'

const routes = [
  {
    path: '/notification',
    name: 'Notification',
    component: NotificationPage
  },
  {
    path: '/timer',
    name: 'Timer',
    component: TimerPage
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
