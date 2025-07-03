<template>
  <v-container class="fill-height d-flex justify-center align-center" fluid>
    <v-card class="pa-6" width="500">
      <v-card-title>Iniciar Sesión</v-card-title>
      <v-card-text>
        <v-form @submit.prevent="login">
          <v-text-field v-model="email" label="Correo electrónico" required />
          <v-text-field v-model="password" label="Contraseña" type="password" required />

          <v-btn color="primary" type="submit" class="mt-4" block>Entrar</v-btn>

          <v-alert
            v-if="error"
            type="error"
            variant="outlined"
            class="mt-4"
            dismissible
          >
            {{ error }}
          </v-alert>

          <v-alert
            v-if="loggedUser !== null"
            type="success"
            variant="outlined"
            class="mt-4"
            dismissible
          >
            Bienvenido {{ loggedUser.name }}
          </v-alert>
        </v-form>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

const email = ref('')
const password = ref('')
const error = ref('')
const loggedUser = ref(null);

const login = async () => {
    error.value = '';
    loggedUser.value = null;
  try {
    const res = await axios.post('http://localhost:3000/api/login', {
      email: email.value,
      password: password.value,
    })

    console.log('✅ Usuario logueado:', res.data)
    
    loggedUser.value = res.data.user;
  } catch (err) {
    password.value = '';
    error.value = err.response?.data?.error || 'Error al iniciar sesión'
  }
}
</script>
