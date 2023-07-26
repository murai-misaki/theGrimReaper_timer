const setItem = (headers, guest, name) => {
  window.localStorage.setItem('access-token', headers['access-token'])
  window.localStorage.setItem('client', headers.client)
  window.localStorage.setItem('uid', headers.uid)
  window.localStorage.setItem('guest', guest)
  window.localStorage.setItem('name', name)
}

export default setItem