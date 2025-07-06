<template>
  <v-container class="py-8" style="max-width: 600px">
    <h1 class="text-2xl font-bold mb-6">Registro de Usuario</h1>

    <v-form v-model="formValid" @submit.prevent="submitForm">
      <v-text-field
        v-model="form.email"
        label="Correo electrónico"
        type="email"
        :rules="[rules.required, rules.email]"
        outlined
        dense
      />
      <v-text-field
        v-model="form.password"
        label="Contraseña"
        type="password"
        :rules="[rules.required, rules.min(6)]"
        outlined
        dense
      />
      <v-text-field
        v-model="form.first_name"
        label="Nombre(s)"
        :rules="[rules.required]"
        outlined
        dense
      />
      <v-text-field
        v-model="form.last_name"
        label="Apellido(s)"
        :rules="[rules.required]"
        outlined
        dense
      />
      <v-text-field
        v-model="form.address"
        label="Dirección"
        :rules="[rules.required]"
        outlined
        dense
      />
      <v-text-field
        v-model="form.city"
        label="Ciudad"
        :rules="[rules.required]"
        outlined
        dense
      />
      <v-text-field
        v-model="form.state"
        label="Estado"
        :rules="[rules.required]"
        outlined
        dense
      />
      <v-text-field
        v-model="form.zip_code"
        label="Código postal"
        :rules="[rules.required]"
        outlined
        dense
      />
      <v-text-field
        v-model="form.phone_number"
        label="Teléfono"
        :rules="[rules.required]"
        outlined
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
  </v-container>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

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

const rules = {
  required: (v) => !!v || 'Este campo es obligatorio',
  email: (v) => /.+@.+\..+/.test(v) || 'Correo inválido',
  min: (length) => (v) => (v?.length >= length) || `Mínimo ${length} caracteres`,
}

const submitForm = async () => {
  try {
    await axios.post('http://localhost:3000/api/createUser', form.value)
    successMessage.value = '¡Registro exitoso!'
    errorMessage.value = ''
    form.value = {
      email: '',
      password: '',
      first_name: '',
      last_name: '',
      address: '',
      city: '',
      zip_code: '',
      state: '',
      phone_number: '',
    }
  } catch (error) {
    errorMessage.value = error.message;
    successMessage.value = ''
  }
}
</script>
