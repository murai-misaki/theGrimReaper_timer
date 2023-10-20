const authRemoveItem = () => {
  window.localStorage.removeItem('uid')
  window.localStorage.removeItem('access-token')
  window.localStorage.removeItem('client')
  window.localStorage.removeItem('guest')
  window.localStorage.removeItem('name')
  window.localStorage.removeItem('privacy')
  window.localStorage.removeItem('riskUsed')
}

export default authRemoveItem