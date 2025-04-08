<template>

  <div>
    <h2 class="heading belgrano-regular">People</h2>

    <DataTable :value="people" tableStyle="min-width: 50rem">
      <Column field="full_name" header="Full Name" />
      <Column field="tenure" header="Tenure" />
      <Column field="job_function" header="Job Function" />
      <Column field="job_level" header="Job Level" />
      <Column field="department" header="Department" />
      <Column field="location" header="Location" />
      <Column field="manager" header="Manager" />
    </DataTable>
  </div>


</template>

<script setup>

import { Link } from '@inertiajs/vue3'
import { computed } from 'vue'
import { usePage } from '@inertiajs/vue3'

import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import ColumnGroup from 'primevue/columngroup';
import Row from 'primevue/row';
import Button from 'primevue/button'

const page = usePage()
const employee = computed(() => page.props.employee)

defineProps({
  people: Array,
})



</script>