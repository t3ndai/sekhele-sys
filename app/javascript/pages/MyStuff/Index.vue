<template>
  <h2 class="page-heading">My Stuff</h2>

  <div class="page-section">
    <h3 class="heading belgrano-regular">My Details</h3>
    <div class="details-card">
      <p class="value">
        <span class="label"> First Name: </span> {{ details.first_name }}
      </p>
      <p class="value">
        <span class="label">Last Name: </span> {{ details.last_name }}
      </p>
      <p class="value">
        <span class="label">Personal Email: </span> {{ details.personal_email }}
      </p>
      <p class="value">
        <span class="label"> Work Email: </span> {{ details.work_email }}
      </p>
      <p clas="value">
        <span class="label"> Phone1: </span> {{ details.phone1 }}
      </p>
      <p class="value">
        <span class="label">Tenure: </span> {{ details.tenure }}
      </p>
      <p class="value">
        <span class="label">
          Hire Date:
        </span>{{ details.hire_date }}
      </p>
      <p class="value">
        <span class="label"> Nationality: </span> {{ details.nationality }}
      </p>
      <p class="value">
        <span class="label"> Position: </span> {{ details.position }}
      </p>
    </div>
  </div>

  <div class="page-section">
    <h3 class="heading belgrano-regular">Assets</h3>

    <DataTable :value="assets" tableStyle="min-width: 50rem">
      <Column field="name" header="Name" />
      <Column field="category" header="Category" />
      <Column field="serial_number" header="Serial Number" />
      <Column field="assigned_on" header="Assigned On" />
      <Column field="returned_on" header="Returned On" />
    </DataTable>
  </div>

  <div class="page-section">
    <h3 class="heading belgrano-regular">Documents</h3>

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

<style scoped>
.details-card {
  .label {
    color: var(--color-slate-400);
    font-weight: 100;
  }

  .value {
    color: var(--color-slate-800);
    font-weight: 500;
  }

  border: 1px solid #ccc;
  border-radius: 8px;
  background-color: #f9f9f9;
  padding: 0.5rem;
}
</style>