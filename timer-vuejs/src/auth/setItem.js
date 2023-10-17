const setItem = (headers, guest, name, privacy) => {
  window.localStorage.setItem('access-token', headers['access-token'])
  window.localStorage.setItem('client', headers.client)
  window.localStorage.setItem('uid', headers.uid)
  window.localStorage.setItem('guest', guest)
  window.localStorage.setItem('name', name)
  window.localStorage.setItem('privacy', privacy)
}

export default setItem