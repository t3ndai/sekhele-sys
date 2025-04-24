<template>
    <div>
        <div>
            <Button
                label="New Document Type"
                icon="pi pi-plus"
                @click="visible = true"
                class="benefit-btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Document Type"
            :visible="visible"
            @update:visible="visible = $event"
        >
            <form @submit.prevent="saveDocumentType">
                <div class="flex flex-col mb-2 field">
                    <label for="name">Name</label>
                    <InputText id="name" v-model="form.name" />
                </div>

                <div class="field mb-2">
                    <fieldset class="radios">
                        <legend>Document Type</legend>
                        <div class="flex gap-x-2">
                            <div class="flex">
                                <RadioButton
                                    v-model="form.document_type"
                                    inputId="document_type"
                                    name="document_type"
                                    value="company"
                                />
                                <label for="status">Company </label>
                            </div>
                            <div class="flex">
                                <RadioButton
                                    v-model="form.document_type"
                                    inputId="document_type"
                                    name="document_type"
                                    value="personal"
                                />
                                <label for="status">Personal </label>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="flex gap-2 mb-2 field">
                    <label for="required">Required</label>
                    <Checkbox id="required" v-model="form.required" binary />
                </div>

                <div class="mt-2">
                    <Button
                        class="benefit-btn"
                        label="Save"
                        icon="pi pi-save"
                        type="submit"
                        :disabled="form.processing"
                    />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>
import { Dialog, Button, Checkbox, RadioButton, InputText } from "primevue";
import { ref, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

defineProps({
    benefit_types: Array,
});

const form = useForm({
    name: "",
    document_type: "",
    required: false,
});

const visible = ref(false);

function saveDocumentType() {
    form.post(`/organizations/${org_id}/documents`, {
        onSuccess: () => {
            form.reset();
            visible.value = false;
        },
    });
}
</script>

<style scoped>
.benefit-btn {
    background-color: orangered;
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>
