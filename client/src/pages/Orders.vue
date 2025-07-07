<template>
  <v-container fluid class="pa-6">
    <template v-if="!user">
      <v-alert type="warning" border="start" variant="outlined" class="mt-6">
        Debes iniciar sesión para ver tus órdenes.
      </v-alert>
    </template>

    <template v-else>
      <h1 class="text-h5 font-weight-bold text-primary mb-6">
        <v-icon start>mdi-package-variant</v-icon> Mis Órdenes
      </h1>

      <v-alert v-if="orders.length === 0" type="info" variant="tonal" class="mb-6">
        No tienes órdenes registradas.
      </v-alert>

      <v-card v-for="order in orders" :key="order.order_id" class="mb-8" elevation="2">
        <v-card-item>
          <v-card-title class="d-flex justify-space-between align-center">
            <div>
              <span class="text-subtitle-1 font-weight-medium">Orden #{{ order.order_id }}</span>
              <div class="text-caption text-grey-darken-1">{{ formatDate(order.creation_date) }}</div>
            </div>
            <v-chip :color="statusColor(order.status?.name)" variant="tonal">
              {{ order.status?.name || 'Sin estado' }}
            </v-chip>
          </v-card-title>
        </v-card-item>

        <v-divider />

        <v-card-text>
          <v-row dense>
            <v-col cols="12" md="3">
              <v-icon start size="20">mdi-calendar</v-icon>
              <strong>Fecha:</strong> {{ formatDate(order.creation_date) }} <br />
              <v-icon start size="20">mdi-cash</v-icon>
              <strong>Total:</strong> ${{ order.order_total.toFixed(2) }} <br />
              <v-icon start size="20">mdi-truck</v-icon>
              <strong>Envío:</strong> {{ order.shipping_type?.name || 'N/A' }}
            </v-col>

            <v-col cols="12" md="3">
              <v-icon start size="20">mdi-credit-card</v-icon>
              <strong>Tarjeta:</strong> {{ maskedCard(order.payment?.card_number) }} <br />
              <v-icon start size="20">mdi-card-account-details</v-icon>
              <strong>Tipo:</strong> {{ order.payment?.card_type || 'N/A' }} <br />
              <v-icon start size="20">mdi-calendar-clock</v-icon>
              <strong>Vence:</strong> {{ order.payment?.expiry_date || 'N/A' }}
            </v-col>

            <v-col cols="12" md="3">
              <v-icon start size="20">mdi-warehouse</v-icon>
              <strong>Almacén:</strong> {{ order.warehouse?.name || 'N/A' }} <br />
              <v-icon start size="20">mdi-earth</v-icon>
              <strong>País:</strong> {{ order.warehouse?.country || 'N/A' }} <br />
              <v-icon start size="20">mdi-office-building-outline</v-icon>
              <strong>Dirección:</strong> {{ order.warehouse?.address || 'N/A' }}
            </v-col>

            <v-col cols="12" md="3">
              <v-icon start size="20">mdi-truck-delivery</v-icon>
              <strong>Tipo envío:</strong> {{ order.shipping?.name || 'N/A' }} <br />
              <v-icon start size="20">mdi-text-long</v-icon>
              <strong>Descripción:</strong> {{ order.shipping?.description || 'N/A' }} <br />
              <v-icon start size="20">mdi-account-outline</v-icon>
              <strong>Receptor:</strong> {{ order.receiver_name || 'N/A' }}
            </v-col>
          </v-row>

          <v-divider class="my-4" />

          <div v-if="order.cart?.details?.length">
            <h4 class="text-subtitle-2 mb-2">
              <v-icon start size="20">mdi-cart</v-icon> Productos
            </h4>
            <v-list lines="two" density="comfortable">
              <v-list-item
                v-for="item in order.cart.details"
                :key="item.product_id"
              >
                <v-list-item-title>
                  <strong>{{ item.product.name }}</strong>
                </v-list-item-title>
                <v-list-item-subtitle>
                  x{{ item.quantity }} – ${{ item.total_price.toFixed(2) }}
                </v-list-item-subtitle>
              </v-list-item>
            </v-list>
          </div>
        </v-card-text>
      </v-card>
    </template>
  </v-container>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import axios from 'axios'

const user = JSON.parse(localStorage.getItem('user'))
const orders = ref([])

const formatDate = (dateStr) => {
  const date = new Date(dateStr)
  return date.toLocaleDateString('es-MX', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}

const maskedCard = (number) => {
  if (!number) return 'N/A'
  return '**** **** **** ' + number.slice(-4)
}

const statusColor = (statusName) => {
  switch (statusName) {
    case 'Pending Payment':
      return 'warning';     // #FFA726
    case 'Paid':
      return 'success';     // #66BB6A
    case 'Processing':
      return 'accent';      // #A5D6A7
    case 'Shipped':
      return 'info';        // #26C6DA
    case 'In Transit':
      return 'primary';     // #43A047
    case 'Delivered':
      return 'secondary';   // #1B5E20
    case 'Cancelled':
      return 'error';       // #EF5350
    case 'Refunded':
      return 'info';        // #26C6DA
    case 'Failed':
      return 'error';       // #EF5350
    case 'Returned':
      return 'accent';      // #A5D6A7
    default:
      return 'grey';
  }
}

onMounted(async () => {
  if (!user) return

  try {
    await axios.get(`http://localhost:3000/api/order/user/${user.id}`).then((res) => {
      orders.value = res.data
    })
  } catch (error) {
    console.error('Error al obtener órdenes:', error)
  }
})
</script>
