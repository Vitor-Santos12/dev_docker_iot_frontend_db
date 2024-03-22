<template>
  <div class="api-container">
    <h5>API Teste</h5>
    <div v-if="info" class="data-container">
      <p>{{ info }}</p>
    </div>
    <div v-else class="loading-container">
      <p>Carregando...</p>
    </div>
  </div>
</template>

<script>

// import produto from '@/services/produtos'

// export default {

//   mounted () {
//     produto.listar().then(resposta => {
//       console.log(resposta)
//     })
//   }
// }

import axios from 'axios'

export default {
  data () {
    return {
      info: null
    }
  },
  mounted () {
    this.fetchData()
    setInterval(this.fetchData, 5000)
  },
  methods: {
    fetchData () {
      axios
        .get('http://127.0.0.1:8081/produtos') // Alterado para acessar através do proxy configurado
        .then(response => {
          this.info = response.data
          console.log(response.data)
        })
        .catch(error => {
          console.error('Erro ao buscar dados:', error)
        })
    }
  }
}
</script>

<style>
.api-container {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.data-container {
  margin-top: 20px;
}

.loading-container {
  margin-top: 20px;
  text-align: center;
  color: #888;
}
</style>
