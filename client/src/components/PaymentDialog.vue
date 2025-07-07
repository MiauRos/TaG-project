<template>
  <v-dialog v-model="dialog" max-width="500">
    <v-card>
      <v-card-title>Selecciona tu método de pago</v-card-title>
      <v-card-text>
        <v-radio-group v-model="selectedPaymentId">
          <v-radio
            v-for="payment in paymentMethods"
            :key="payment.payment_id"
            :label="`${payment.card_type} - **** ${payment.card_number.slice(-4)} (Exp: ${payment.expiry_date})`"
            :value="payment.payment_id"
          />
        </v-radio-group>
      </v-card-text>
      <v-card-actions>
        <v-spacer />
        <v-btn text @click="close">Cancelar</v-btn>
        <v-btn color="primary" @click="confirm">Confirmar</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';

const emit = defineEmits(['close', 'confirm']);
const dialog = ref(true);
const paymentMethods = ref([]);
const selectedPaymentId = ref(null);
const user = JSON.parse(localStorage.getItem('user'));

const close = () => emit('close');
const confirm = () => emit('confirm', selectedPaymentId.value);

onMounted(async () => {
  const res = await axios.get(`http://localhost:3000/api/payment/user/${user.id}`);
  paymentMethods.value = res.data;
});
</script>
