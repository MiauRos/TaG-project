<template>
  <v-container fluid class="pa-5">
    <!-- Sección de bienvenida -->
    <v-container class="py-12">
      <v-row justify="center" class="mb-10">
        <v-col cols="12" md="8" class="text-center">
          <h1 class="text-h3 font-weight-bold mb-4 text-primary">
            ¡Bienvenido!
          </h1>
          <v-img
            :src="logo"
            class="mx-auto mb-6"
            alt="Logo de Tech and Gadgets"
          />
          <p class="text-subtitle-1 mb-6">
            Descubre innovación, calidad y tecnología en un solo lugar.
          </p>
          <v-btn color="primary" size="large" prepend-icon="mdi-cart" to="/products">
            Explorar productos
          </v-btn>
        </v-col>
      </v-row>

      <!-- Beneficios -->
      <v-row class="text-center">
        <v-col cols="12" md="4">
          <v-icon size="60" color="primary">mdi-truck-fast</v-icon>
          <h3 class="text-h6 font-weight-bold mt-3">Envíos rápidos</h3>
          <p>Recibe tus productos en tiempo récord a todo el país.</p>
        </v-col>
        <v-col cols="12" md="4">
          <v-icon size="60" color="secondary">mdi-credit-card-check-outline</v-icon>
          <h3 class="text-h6 font-weight-bold mt-3">Pagos seguros</h3>
          <p>Tu información está protegida con la mejor tecnología.</p>
        </v-col>
        <v-col cols="12" md="4">
          <v-icon size="60" color="success">mdi-star-circle</v-icon>
          <h3 class="text-h6 font-weight-bold mt-3">Calidad garantizada</h3>
          <p>Solo los mejores productos seleccionados para ti.</p>
        </v-col>
      </v-row>
    </v-container>

    <!-- Testimonios -->
    <v-container class="py-12" style="background-color: #f5f5f5;" fluid>
      <h2 class="text-center text-h4 font-weight-bold mb-6 text-primary">Testimonios</h2>
      <v-carousel
        hide-delimiters
        cycle
        height="250"
        show-arrows="hover"
        class="bg-background"
      >
        <v-carousel-item
          v-for="(testimonial, index) in testimonials"
          :key="index"
        >
          <v-row align="center" justify="center" class="h-100">
            <v-col cols="12" md="8" class="text-center">
              <v-avatar size="80" class="mb-4">
                <v-img :src="testimonial.avatar" />
              </v-avatar>
              <blockquote class="italic mb-2">"{{ testimonial.quote }}"</blockquote>
              <div class="font-weight-medium">{{ testimonial.name }}</div>
            </v-col>
          </v-row>
        </v-carousel-item>
      </v-carousel>
    </v-container>
  </v-container>
</template>

<script setup>
import logo from '../assets/TaG_logo_name.png';

const testimonials = [
  {
    name: 'Ana López',
    quote: 'Excelente servicio y productos de gran calidad. ¡Repetiré sin duda!',
    avatar: 'https://randomuser.me/api/portraits/women/44.jpg'
  },
  {
    name: 'Carlos Martínez',
    quote: 'Muy satisfecho con mi compra. El envío fue rapidísimo.',
    avatar: 'https://randomuser.me/api/portraits/men/32.jpg'
  },
  {
    name: 'Lucía Torres',
    quote: '¡Me encanta la variedad de productos que tienen!',
    avatar: 'https://randomuser.me/api/portraits/women/12.jpg'
  },
  {
    name: 'Jorge Ramírez',
    quote: 'Encontré justo lo que necesitaba y a muy buen precio.',
    avatar: 'https://randomuser.me/api/portraits/men/75.jpg'
  },
  {
    name: 'Jessica López',
    quote: 'La atención al cliente fue excelente, resolvieron mis dudas al instante.',
    avatar: 'https://randomuser.me/api/portraits/women/19.jpg'
  },
  {
    name: 'David Navarro',
    quote: 'Todo llegó en perfectas condiciones y antes de lo previsto.',
    avatar: 'https://randomuser.me/api/portraits/men/52.jpg'
  },
  {
    name: 'Isabel Fernández',
    quote: 'Una experiencia de compra muy fluida. Recomiendo mucho esta tienda.',
    avatar: 'https://randomuser.me/api/portraits/women/24.jpg'
  },
  {
    name: 'Luis Gómez',
    quote: 'Productos confiables y servicio impecable. ¡5 estrellas!',
    avatar: 'https://randomuser.me/api/portraits/men/41.jpg'
  }
];
</script>

<style scoped>
blockquote {
  font-size: 1.1rem;
  color: #555;
}
</style>
