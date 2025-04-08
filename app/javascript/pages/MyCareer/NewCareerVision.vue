<template>
    <div>
        <Button label="New Talent" icon="pi pi-plus" @click="visible = true" class="new-btn" />
    </div>

    <div>
        <Dialog v-model="visible" :visible="visible" header="New Career Vision" @update:visible="visible = $event">
            <form class="space-y-4" @submit.prevent="saveCareerVision">
                <div>
                    <FloatLabel>
                        <label for="title">Name</label>
                        <InputText id="title" v-model="form.name" />
                    </FloatLabel>
                </div>
                <div>
                    <FloatLabel>
                        <label for="notes">Description</label>
                        <Textarea id="notes" v-model="form.description" rows="5" cols="30" />
                    </FloatLabel>
                </div>
                <div>
                    <label for="outline">Vision For</label>

                    <div v-for="outline in outlines" :key="outline.value">
                        <RadioButton v-model="form.outline" :inputId="outline.value" :name="dynamic"
                            :value="outline.value" />
                        <label :for="outline.value" class="ml-2">{{ outline.name }}</label>
                    </div>
                </div>
                <div>
                    <Button label="Save" icon="pi pi-save" type="submit" :disabled="form.processing" />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>

import Button from 'primevue/button'
import Dialog from 'primevue/dialog'
import Textarea from 'primevue/textarea'
import FloatLabel from 'primevue/floatlabel'
import InputText from 'primevue/inputtext';
import RadioButton from 'primevue/radiobutton';
import { useForm, usePage } from '@inertiajs/vue3'
import { ref, computed } from 'vue'

const page = usePage()
const employee = computed(() => page.props.employee)

const visible = ref(false)

defineProps({
    outlines: Array,
})

const form = useForm({
    name: '',
    description: '',
    outline: ''
})


function saveCareerVision() {
    form.post(`/employees/${employee.value.id}/career_visions`)
    visible.value = false
    form.reset()
}

</script>

<style scoped>
.new-btn {
    background-color: orangered;
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>