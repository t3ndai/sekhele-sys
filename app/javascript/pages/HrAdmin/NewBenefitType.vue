<template>
    <div>
        <div class="subsection">
            <Button
                label="New Benefit Type"
                icon="pi pi-plus"
                @click="visible = true"
                class="benefit-btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Benefit Type"
            :visible="visible"
            @update:visible="visible = $event"
        >
            <form @submit.prevent="saveBenefitType">
                <div class="flex flex-col gap-y-2">
                    <label for="name">Name</label>
                    <InputText id="name" v-model="form.name" />
                    <Message
                        v-if="form.errors.name"
                        severity="error"
                        size="small"
                        variant="simple"
                        >{{ form.errors.name }}</Message
                    >
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
import { Dialog, Button, Message, InputText } from "primevue";
import { ref, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

const visible = ref(false);

const form = useForm({
    name: "",
});

function saveBenefitType() {
    // /organizations/:organization_id/benefit_types
    form.post(`/organizations/${org_id}/benefit_types`, {
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
