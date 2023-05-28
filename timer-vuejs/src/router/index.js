import { createRouter, createWebHistory } from 'vue-router'

import NotificationPage from '../views/NotificationPage'
import TimerPage from '../views/TimerPage'
import MyPage from '../views/MyPage'
import GuestloginPage from '../views/GuestloginPage'

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
  },
  {
    path: '/mypage',
    name: 'Mypage',
    component: MyPage
  },
  {
    path: '/guestlogin',
    name: 'Guestlogin',
    component: GuestloginPage
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
