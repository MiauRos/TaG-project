<template>
  <v-container class="fill-height d-flex justify-center align-center" fluid>
    <v-card class="pa-6" width="500">
      <v-card-title>Iniciar Sesión</v-card-title>
      <v-card-text>
        <v-form @submit.prevent="login">
          <v-text-field
            v-model="email"
            label="Correo electrónico"
            required
            variant="outlined"
            density="compact"
            color="primary"
          />
          <v-text-field
            v-model="password"
            label="Contraseña"
            type="password"
            required
            variant="outlined"
            density="compact"
            color="primary"
          />
          <v-btn
            color="primary"
            type="submit"
            class="mt-4"
            block
          >Entrar</v-btn>

          <v-alert
            v-if="error"
            type="error"
            variant="outlined"
            class="mt-4"
            dismissible
          >
            {{ error }}
          </v-alert>
        </v-form>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script setup>
import { ref } from 'vue';
import axios from 'axios';
import { useRouter } from 'vue-router';
import { useUserStore } from '@/stores/user.js';

const userStore = useUserStore();

const email = ref('');
const password = ref('');
const error = ref('');
const router = useRouter();

const login = async () => {
  try {
    const res = await axios.post('http://localhost:3000/api/user/login', {
      email: email.value,
      password: password.value,
    });

    // Guardar usuario en el store y localStorage
    userStore.login(res.data.user);

    router.push('/')
  } catch (err) {
    error.value = err.response?.data?.error || 'Error al iniciar sesión';
  }
};
</script>
