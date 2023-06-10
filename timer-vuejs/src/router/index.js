import { createRouter, createWebHistory } from 'vue-router'

import useValidate from '../auth/validate'
import TopPage from '../views/TopPage'
import NotificationPage from '../views/NotificationPage'
import TimerPage from '../views/TimerPage'
import MyPage from '../views/MyPage'
import GuestloginPage from '../views/GuestloginPage'
import AccountPage from '../views/AccountPage'
import TotalshortenedlifespanPage from '../views/TotalshortenedlifespanPage'
import RankingPage from '../views/RankingPage'

const { error, validate } = useValidate()

const requireAuth = async (to, from, next) => {
  const uid = window.localStorage.getItem('uid')
  const client = window.localStorage.getItem('client')
  const accessToken = window.localStorage.getItem('access-token')

  if (!uid || !client || !accessToken) {
    console.log('ログインしていません')
    next({ name: 'Top' })
    return // ログインしていない場合は、requireAuthの処理をここで終わらせる
  }

  await validate()

  if (error.value) {
    console.log('認証に失敗しました')
    next({ name: 'Top' })
  } else {
    next()
  }
}

const noRequireAuth = async (to, from, next) => {
  const uid = window.localStorage.getItem('uid')
  const client = window.localStorage.getItem('client')
  const accessToken = window.localStorage.getItem('access-token')
  const guest = window.localStorage.getItem('guest')

  if (!uid && !client && !accessToken || guest === 'true') {
    next()
    return
  }

  await validate()

  if (!error.value && guest === 'false') {
    next({ name: 'Mypage' })
  } else {
    next()
  }
}

const routes = [
  {
    path: '/',
    name: 'Top',
    component: TopPage,
    beforeEnter: noRequireAuth
  },
  {
    path: '/notification',
    name: 'Notification',
    component: NotificationPage,
    beforeEnter: requireAuth
  },
  {
    path: '/timer',
    name: 'Timer',
    component: TimerPage,
    beforeEnter: requireAuth
  },
  {
    path: '/mypage',
    name: 'Mypage',
    component: MyPage,
    beforeEnter: requireAuth
  },
  {
    path: '/guestlogin',
    name: 'Guestlogin',
    component: GuestloginPage,
    beforeEnter: requireAuth
  },
  {
    path: '/accountpage',
    name: 'Accountpage',
    component: AccountPage,
    beforeEnter: requireAuth
  },
  {
    path: '/totalshortenedlifespan',
    name: 'Totalshortenedlifespan',
    component: TotalshortenedlifespanPage,
    beforeEnter: requireAuth
  },
  {
    path: '/rankingpage',
    name: 'Rankingpage',
    component: RankingPage,
    beforeEnter: requireAuth
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
