const removeItem = () => {
  window.localStorage.removeItem('totalCountUp')
  window.localStorage.removeItem('todayExercise')
  window.localStorage.removeItem('todayShortenedLifespan')
}

export default removeItem