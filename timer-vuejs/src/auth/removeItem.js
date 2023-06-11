const authRemoveItem = () => {
  window.localStorage.removeItem('uid')
  window.localStorage.removeItem('access-token')
  window.localStorage.removeItem('client')
  window.localStorage.removeItem('guest')
}

export default authRemoveItem