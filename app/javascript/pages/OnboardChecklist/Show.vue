<template>

  <Head :title="`Onboard checklist #${onboard_checklist.id}`" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Onboard checklist #{{ onboard_checklist.name }}</h1>

  <OnboardChecklist :onboard_checklist="onboard_checklist" />

  <div>
    <div> Add Item</div>
    <div>
      <Form :onboard_task :assignees submitText="Add Item" @onSubmit="handleSubmit" />
    </div>
  </div>

  <div>
    <div class="text-xl font-bold">Items</div>
    <DataTable :value="onboard_tasks" tableStyle="min-width: 50rem">
      <Column field="name" header="Name" />
      <Column field="assignee" header="Assignee">
        <template #body="slotProps">
          {{ slotProps.data.assignee.name }}
        </template>
      </Column>
      <Column field="due_on" header="Due on" />
      <Column field="complete" header="Completed">
        <template #body="slotProps">
          <div class="flex gap-x-4">
            <div v-if="slotProps.data.complete">
              <input type="checkbox" :checked="slotProps.data.complete" disabled />
            </div>
          </div>
        </template>
      </Column>
      <Column header="Actions">
        <template #body="slotProps">
          <div class="flex gap-x-4">
            <button @click="handleComplete(slotProps.data)" class="btn btn-secondary"
              :disabled="slotProps.data.complete">Complete</button>
          </div>
        </template>
      </Column>
    </DataTable>
  </div>

  <div>
    <Link :href="`/onboard_checklists/${onboard_checklist.id}/edit`">Edit this onboard checklist</Link> |
    <Link href="/onboard_checklists">Back to onboard checklists</Link>

    <br />

    <Link :href="`/onboard_checklists/${onboard_checklist.id}`" as="button" method="delete">
    Destroy this onboard checklist
    </Link>
  </div>
</template>

<script setup>
import { Head, Link, router } from '@inertiajs/vue3'
import OnboardChecklist from './OnboardChecklist.vue'
import Form from '../OnboardTask/Form.vue'
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';


const { onboard_checklist, flash, onboard_task, assignees, onboard_tasks } = defineProps(['onboard_checklist', 'flash', 'onboard_task', 'assignees', 'onboard_tasks'])

const handleSubmit = (form) => {
  form.transform((data) => ({ onboard_task: data }))
  form.post(`/onboard_checklists/${onboard_checklist.id}/onboard_tasks`, {
    onSuccess: () => {
      form.reset()
    }
  })
}

function handleComplete(onboard_task) {
  router.put(`/onboard_tasks/${onboard_task.id}`, {
    onboard_task: {
      complete: true
    },
  })
}

</script>

<style scoped>
.notice {
  color: green;
}
</style>
