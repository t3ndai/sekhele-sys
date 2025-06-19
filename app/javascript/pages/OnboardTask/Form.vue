<template>
  <form @submit.prevent="emit('onSubmit', form)" class="flex gapx-4 space-x-4 items-center">
    <div>
      <label class="label" for="name">Name</label>
      <input type="text" name="name" class="form-control" id="name" v-model="form.name" />
      <div v-if="form.errors.name" class="error">
        {{ form.errors.name.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="assignee">Assignee</label>
      <Select :options="assignees" optionValue="id" optionLabel="name" name="assignee" id="assignee" type="text"
        placeholder="Select Assignee" filter v-model="form.assignee_id" />
      <div v-if="form.errors.assignee_id" class="error">
        {{ form.errors.assignee_id.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="tag">Tags</label>
      <input type="text" class="form-control" name="tag" id="tag" v-model="form.tags" />
      <div v-if="form.errors.tags" class="error">
        {{ form.errors.tags.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="due_on">Due on</label>
      <input type="date" class="form-control" name="due_on" id="due_on" v-model="form.due_on" />
      <div v-if="form.errors.due_on" class="error">
        {{ form.errors.due_on.join(', ') }}
      </div>
    </div>
    <div>
      <button type="submit" :disabled="form.processing || formInvalid" class="btn btn-primary">
        {{ submitText }}
      </button>
    </div>
  </form>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3'
import { computed } from 'vue'
import Select from 'primevue/select'

const formInvalid = computed(() => (!form.name || !form.assignee_id))

const { onboard_task, submitText, assignees } = defineProps(['onboard_task', 'submitText', 'assignees'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  name: onboard_task.name || '',
  assignee_id: onboard_task.assignee_id || '',
  tags: onboard_task.tags || '',
  due_on: onboard_task.due_on || '',
})
</script>

<style scoped>
.label {
  display: block;
}

.error {
  color: red;
}
</style>
