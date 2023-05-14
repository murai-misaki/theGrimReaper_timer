import { createRouter, createWebHistory } from 'vue-router'

import NotificationPage from '../views/NotificationPage'

const routes = [
  {
    path: '/notification',
    name: 'Notification',
    component: NotificationPage
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
