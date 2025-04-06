<template>
  <div>
    <h2 class="heading belgrano-regular"> My Reports </h2>
    <div v-for="report in reports">
      <div class="report-card">
        <div class="name">
          {{ report.name }}
        </div>
        <div>
          <Link :href="`/employees/${report.id}/one_to_ones`">
          Past 1-1s
          </Link>
        </div>
        <div>
          <Link :href="`/employees/${report.id}/one_to_ones/new`">
          New 1-1
          </Link>
        </div>
        <div>
          <Link :href="`/employees/${employee.id}/reports/${report.id}/goals`">
          View Goals
          </Link>
        </div>
      </div>
    </div>
  </div>

</template>


<script setup>

import { Link } from '@inertiajs/vue3'
import { computed, ref } from 'vue'
import { usePage } from '@inertiajs/vue3'
import Button from 'primevue/button';

const page = usePage()
const employee = computed(() => page.props.employee)

defineProps({
  reports: Array,
})

</script>

<style scoped>
.report-card {
  border: 1px solid #ccc;
  border-radius: 8px;
  padding: 16px;
  margin-bottom: 16px;
  background-color: #f9f9f9;

  .name {
    font-size: 1.2rem;
    font-weight: bold;
    font-family: 'Belgrano', sans-serif;
  }
}
</style>