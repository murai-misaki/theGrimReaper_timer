import { createRouter, createWebHistory } from 'vue-router'

import NotificationPage from '../views/NotificationPage'
import TimerPage from '../views/TimerPage'
import MyPage from '../views/MyPage'
import GuestloginPage from '../views/GuestloginPage'
import AccountPage from '../views/AccountPage'
import TotalshortenedlifespanPage from '../views/TotalshortenedlifespanPage'
import RankingPage from '../views/RankingPage'

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
  {
    path: '/accountpage',
    name: 'Accountpage',
    component: AccountPage
  },
  {
    path: '/totalshortenedlifespan',
    name: 'Totalshortenedlifespan',
    component: TotalshortenedlifespanPage
  },
  {
    path: '/rankingpage',
    name: 'Rankingpage',
    component: RankingPage
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
