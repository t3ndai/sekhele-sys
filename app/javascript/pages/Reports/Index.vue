<template>
  <div>
    <h2 class="heading belgrano-regular"> My Reports </h2>
    <DataTable :value="reports" tableStyle="min-width: 50rem">
      <Column field="name" header="Report"></Column>
      <Column>
        <template #body="{ data }">
          <Link :href="`/employees/${data.id}/one_to_ones`">
          Past 1-1s
          </Link>
        </template>
      </Column>
      <Column>
        <template #body="{ data }">
          <Link :href="`/employees/${data.id}/one_to_ones/new`">
          New 1-1
          </Link>
        </template>
      </Column>
      <Column>
        <template #body="{ data }">
          <Button>
            View Goals
          </Button>
          <Goal :goals="data.goals" />
        </template>
      </Column>
    </DataTable>
  </div>

  <div>

  </div>

</template>


<script setup>

import { Link } from '@inertiajs/vue3'
import { computed, ref } from 'vue'
import { usePage } from '@inertiajs/vue3'
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import Button from 'primevue/button';
import Goal from './Goal.vue';

defineProps({
  reports: Array,
})

</script>