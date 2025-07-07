<template>
  <v-container class="py-8" style="max-width: 600px">
    <v-card class="pa-6" width="700">
      <v-card-title class="text-h6 font-weight-bold text-primary">
        Registro de Usuario
      </v-card-title>

      <v-card-text>
        <v-form v-model="formValid" @submit.prevent="submitForm">
          <v-text-field
            variant="outlined"
            density="compact"
            color="primary"
            v-model="form.email"
            label="Correo electrónico"
            type="email"
            :rules="[rules.required, rules.email]"
            dense
          />
          <v-text-field
            variant="outlined"
            density="compact"
            color="primary"
            v-model="form.password"
            label="Contraseña"
            type="password"
            :rules="[rules.required, rules.min(6)]"
            dense
          />
          <v-text-field
            variant="outlined"
            density="compact"
            color="primary"
            v-model="form.first_name"
            label="Nombre(s)"
            :rules="[rules.required]"
            dense
          />
          <v-text-field
            variant="outlined"
            density="compact"
            color="primary"
            v-model="form.last_name"
            label="Apellido(s)"
            :rules="[rules.required]"
            dense
          />
          <v-text-field
            variant="outlined"
            density="compact"
            color="primary"
            v-model="form.address"
            label="Dirección"
            :rules="[rules.required]"
            dense
          />
          <v-text-field
            variant="outlined"
            density="compact"
            color="primary"
            v-model="form.city"
            label="Ciudad"
            :rules="[rules.required]"
            dense
          />
          <v-text-field
            variant="outlined"
            density="compact"
            color="primary"
            v-model="form.state"
            label="Estado"
            :rules="[rules.required]"
            dense
          />
          <v-text-field
            variant="outlined"
            density="compact"
            color="primary"
            v-model="form.zip_code"
            label="Código postal"
            :rules="[rules.required]"
            dense
          />
          <v-text-field
            variant="outlined"
            density="compact"
            color="primary"
            v-model="form.phone_number"
            label="Teléfono"
            :rules="[rules.required]"
            dense
          />

          <v-btn type="submit" color="primary" :disabled="!formValid" class="mt-4">
            Registrarse
          </v-btn>

          <v-alert
            v-if="successMessage"
            type="success"
            class="mt-4"
            border="start"
            colored-border
            elevation="2"
          >
            {{ successMessage }}
          </v-alert>

          <v-alert
            v-if="errorMessage"
            type="error"
            class="mt-4"
            border="start"
            colored-border
            elevation="2"
          >
            {{ errorMessage }}
          </v-alert>
        </v-form>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'
import { useUserStore } from '@/stores/user'

const form = ref({
  email: '',
  password: '',
  first_name: '',
  last_name: '',
  address: '',
  city: '',
  zip_code: '',
  state: '',
  phone_number: '',
})

const formValid = ref(false)
const successMessage = ref('')
const errorMessage = ref('')
const router = useRouter()
const userStore = useUserStore()

const rules = {
  required: (v) => !!v || 'Este campo es obligatorio',
  email: (v) => /.+@.+\..+/.test(v) || 'Correo inválido',
  min: (length) => (v) => (v?.length >= length) || `Mínimo ${length} caracteres`,
}

const submitForm = async () => {
  try {
    // Registro del usuario
    await axios.post('http://localhost:3000/api/user/', form.value)

    // Login automático después del registro
    const res = await axios.post('http://localhost:3000/api/user/login', {
      email: form.value.email,
      password: form.value.password
    })

    userStore.login(res.data.user)
    successMessage.value = '¡Registro exitoso! Iniciando sesión...'
    errorMessage.value = ''

    // Redirección
    router.push('/')

  } catch (error) {
    errorMessage.value = error.response?.data?.error || 'Error al registrar usuario'
    successMessage.value = ''
  }
}
</script>
