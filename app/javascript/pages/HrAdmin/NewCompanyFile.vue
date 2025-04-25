<template>
    <div>
        <div>
            <Button
                label="New Company File"
                icon="pi pi-plus"
                @click="visible = true"
                class="leave-btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Company File"
            :visible="visible"
            @update:visible="visible = $event"
        >
            <form @submit.prevent="saveCompanyFile">
                <div class="flex flex-col mb-2">
                    <Select
                        placeholder="Select Company Document Type"
                        :options="company_docs"
                        optionLabel="name"
                        optionValue="id"
                        v-model="form.document_id"
                    />
                    <div v-if="form.errors.document_id" class="error">
                        {{ form.errors.document_id.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2 field">
                    <label for="employee_contribution">File</label>
                    <input
                        type="file"
                        @change="form.file = $event.target.files[0]"
                    />
                </div>
                <div>
                    <Button
                        class="leave-btn"
                        type="submit"
                        :disabled="form.processing"
                        label="Save Company File"
                        icon="pi pi-save"
                    />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>
import { Dialog, Select, Button } from "primevue";
import { ref, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

const form = useForm({
    document_id: "",
    file: null,
});

const visible = ref(false);

defineProps({
    company_docs: Array,
});

function saveCompanyFile() {
    form.transform((data) => ({ company_file: data }));
    form.post(`/organizations/${org_id}/company_files`, {
        onSuccess: () => {
            form.reset();
            visible.value = false;
        },
    });
}
</script>

<style scoped>
.leave-btn {
    background-color: orangered;
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>
