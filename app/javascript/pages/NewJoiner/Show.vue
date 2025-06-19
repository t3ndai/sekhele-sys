<template>

  <Head :title="`New joiner #${new_joiner.id}`" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>New joiner #{{ new_joiner.name }}</h1>

  <NewJoiner :new_joiner="new_joiner" />

  <div class="flex gap-x-4">
    <div>
      <Link :href="`/new_joiners/${new_joiner.id}/onboarding_events/new`"
        class="bg-sky-600 hover:bg-sky-700 text-white p-2 rounded">
      New Onboarding event
      </Link>
    </div>

    <div>
      <Link :href="`/new_joiners/${new_joiner.id}/onboard_checklists/new`"
        class="bg-sky-600 hover:bg-sky-700 text-white p-2 rounded">
      New Onboard Checklist
      </Link>
    </div>
  </div>

  <div class="mt-4">
    <div class="text-xl font-bold">Onboarding Events</div>
    <DataTable :value="onboarding_events" tableStyle="min-width: 50rem">
      <Column field="on" header="On" />
      <Column field="at" header="At" />
      <Column field="contact" header="Contact">
        <template #body="slotProps">
          {{ slotProps.data.contact.name }}
        </template>
      </Column>
      <Column field="manager" header="Manager">
        <template #body="slotProps">
          {{ slotProps.data.manager.name }}
        </template>
      </Column>
      <Column field="instructions" header="Instructions" />
    </DataTable>
  </div>

  <div class="mt-4">
    <div class="text-xl font-bold">Onboard Checklists</div>
    <DataTable :value="onboard_checklists" tableStyle="min-width: 50rem">
      <Column field="name" header="Name" />
      <Column>
        <template #body="slotProps">
          <Link :href="`/onboard_checklists/${slotProps.data.id}/`"
            class="bg-gray-300 hover:bg-gray-500 text-white p-2 rounded">
          View
          </Link>
        </template>
      </Column>
    </DataTable>
  </div>

  <div>
    <Link :href="`/new_joiners/${new_joiner.id}/edit`">Edit this new joiner</Link> |
    <Link href="/new_joiners">Back to new joiners</Link>

    <br />

    <Link :href="`/new_joiners/${new_joiner.id}`" as="button" method="delete">
    Destroy this new joiner
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import NewJoiner from './NewJoiner.vue'
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';

const { new_joiner, flash, onboarding_events, onboard_checklists } = defineProps(['new_joiner', 'flash', 'onboarding_events', 'onboard_checklists'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>