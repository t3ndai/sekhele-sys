<template>
  <form @submit.prevent="emit('onSubmit', form)">
    <div>
      <label class="label" for="name">Name</label>
      <input type="text" name="name" id="name" v-model="form.name" />
      <div v-if="form.errors.name" class="error">
        {{ form.errors.name.join(', ') }}
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

const formInvalid = computed(() => !form.name)


const { onboard_checklist, submitText } = defineProps(['onboard_checklist', 'submitText'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  new_joiner_id: onboard_checklist.new_joiner_id || '',
  name: onboard_checklist.name || '',
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
