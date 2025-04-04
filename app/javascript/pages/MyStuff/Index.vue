<template>
  <div>
    <h2 class="heading belgrano-regular">My Details</h2>
    <p>
      First Name: {{ details.first_name }}<br />
      Last Name: {{ details.last_name }}<br />
      Personal Email: {{ details.personal_email }}<br />
      Work Email: {{ details.work_email }}<br />
      Phone1: {{ details.phone1 }}<br />
      Tenure: {{ details.tenure }}<br />
      Hire Date: {{ details.hire_date }}<br />
      Nationality: {{ details.nationality }}<br />
    </p>
  </div>

  <div>
    <h2 class="heading belgrano-regular">Assets</h2>

    <DataTable :value="assets" tableStyle="min-width: 50rem">
      <Column field="name" header="Name" />
      <Column field="category" header="Category" />
      <Column field="serial_number" header="Serial Number" />
      <Column field="assigned_on" header="Assigned On" />
      <Column field="returned_on" header="Returned On" />
    </DataTable>
  </div>

  <div>
    <h2 class="heading belgrano-regular">Documents</h2>

    <div v-for="doc in docs">
      <a :href="doc.url" target="_blank">{{ doc.name }}</a>
    </div>
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
  assets: Array,
  docs: Array,
  details: Object,
})


</script>